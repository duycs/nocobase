/**
 * This file is part of the NocoBase (R) project.
 * Copyright (c) 2020-2024 NocoBase Co., Ltd.
 * Authors: NocoBase Team.
 *
 * This project is dual-licensed under AGPL-3.0 and NocoBase Commercial License.
 * For more information, please refer to: https://www.nocobase.com/agreement.
 */

import { Plugin } from '@nocobase/server';
import { QueryTypes } from 'sequelize';

export class CsvServiceServer extends Plugin {
  async afterAdd() {}

  async beforeLoad() {}

  async load() {
    this.app.resourceManager.define({
      name: 'csv',
      actions: {
        version: async (ctx, next) => {
          const { vehicle_object_item_id } = ctx.query;
          const db = this.app.db;

          const result = await db.sequelize.query(
            `
            SELECT DISTINCT version FROM vehicle_test_values
            WHERE vehicle_object_item_id = :vehicle_object_item_id
            ORDER BY version DESC`,
            {
              replacements: { vehicle_object_item_id: vehicle_object_item_id },
              type: QueryTypes.SELECT,
            },
          );

          ctx.body = result;

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
