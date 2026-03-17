/**
 * This file is part of the NocoBase (R) project.
 * Copyright (c) 2020-2024 NocoBase Co., Ltd.
 * Authors: NocoBase Team.
 *
 * This project is dual-licensed under AGPL-3.0 and NocoBase Commercial License.
 * For more information, please refer to: https://www.nocobase.com/agreement.
 */

import { number } from 'joi';

export default {
  openapi: '3.0.2',
  info: {
    title: 'NocoBase API - CSV Service plugin',
  },
  paths: {
    '/csv:version': {
      get: {
        tags: ['csv-service'],
        summary: 'Get csv version',
        parameters: [
          {
            name: 'vehicle_object_item_id',
            in: 'query',
            required: false,
            schema: {
              type: 'number',
            },
          },
        ],
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/json': {
                schema: {
                  type: 'object',
                  properties: {
                    version: {
                      type: number,
                      example: 1,
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
  },
};
