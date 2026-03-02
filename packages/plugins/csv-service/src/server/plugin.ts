/**
 * This file is part of the NocoBase (R) project.
 * Copyright (c) 2020-2024 NocoBase Co., Ltd.
 * Authors: NocoBase Team.
 *
 * This project is dual-licensed under AGPL-3.0 and NocoBase Commercial License.
 * For more information, please refer to: https://www.nocobase.com/agreement.
 */

import { Plugin } from '@nocobase/server';

export class CsvServiceServer extends Plugin {
  async afterAdd() {}

  async beforeLoad() {}

  async load() {
    this.app.resourceManager.define({
      name: 'csv/import',
      actions: {
        // Endpoint: GET /api/my_custom_api:checkStatus
        checkStatus: async (ctx, next) => {
          ctx.body = {
            status: 'running',
            timestamp: new Date().toISOString(),
          };
          await next();
        },
        // Endpoint: GET /api/my_custom_api:helloWorld
        helloWorld: async (ctx, next) => {
          ctx.body = { message: 'Hello World' };
          await next();
        },
      },
    });
  }

  async install() {}

  async afterEnable() {}

  async afterDisable() {}

  async remove() {}
}

export default CsvServiceServer;
