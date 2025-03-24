'use strict'

const fs = require('fs/promises');
const path = require('path');

module.exports = async function (fastify, opts) {
  fastify.post('/leaderboard/export', async function (request, reply) {
    const { body } = request

    try {
      const leaders = body.leaders || [];

      if (leaders.length === 0) {
        return reply.code(400).send({ error: 'No leaderboard data provided' });
      }

      const headers = Object.keys(leaders[0]).join(',');
      const rows = leaders.map(leader => {
        return Object.values(leader).map(value => {
          if (typeof value === 'string' && value.includes(',')) {
            return `"${value}"`;
          }
          return value;
        }).join(',');
      });

      // const outputDir = path.join(__dirname, '../');
      const outputDir = path.join(__dirname, '../leaderboard/');
      await fs.mkdir(outputDir, { recursive: true });

      const filename = 'leaderboard.csv';
      const filepath = path.join(outputDir, filename);

      let fileExists = false;
      try {
        await fs.access(filepath);
        fileExists = true;
      } catch (err) {}

      let csvContent;
      if (fileExists) {
        const existingContent = await fs.readFile(filepath, 'utf8');
        const existingLines = existingContent.split('\n');
        const existingHeaders = existingLines[0];

        if (existingHeaders !== headers) {
          return reply.code(400).send({
            error: 'Schema mismatch',
            message: 'The schema of the new data does not match the existing file'
          });
        }

        const existingData = existingLines.slice(1)
          .filter(line => line.trim().length > 0)
          .map(line => {
            const values = line.split(',');
            const record = {};
            headers.split(',').forEach((header, index) => {
              record[header] = values[index];
            });
            return record;
          });

        const uniqueLeaders = leaders.filter(newLeader => {
          return !existingData.some(existingLeader =>
            existingLeader.name === newLeader.name && existingLeader.score === newLeader.score
          );
        });

        if (uniqueLeaders.length === 0) {
          return {
            success: true,
            message: 'No new unique records to add'
          };
        }

        const newRows = uniqueLeaders.map(leader => {
          return Object.values(leader).map(value => {
            if (typeof value === 'string' && value.includes(',')) {
              return `"${value}"`;
            }
            return value;
          }).join(',');
        });

        csvContent = '\n' + newRows.join('\n');
        await fs.appendFile(filepath, csvContent);

        return {
          success: true,
          message: `${uniqueLeaders.length} new records appended successfully`,
          skipped: leaders.length - uniqueLeaders.length
        };
      } else {
        csvContent = [headers, ...rows].join('\n');
        await fs.writeFile(filepath, csvContent);

        return {
          success: true,
          message: 'Leaderboard data file created successfully',
          added: leaders.length
        };
      }

    } catch (error) {
      fastify.log.error(error);
      return reply.code(500).send({
        error: 'Failed to save leaderboard data',
        message: error.message
      });
    }
  });
}
