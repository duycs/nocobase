/**
 * This file is part of the NocoBase (R) project.
 * Copyright (c) 2020-2024 NocoBase Co., Ltd.
 * Authors: NocoBase Team.
 *
 * This project is dual-licensed under AGPL-3.0 and NocoBase Commercial License.
 * For more information, please refer to: https://www.nocobase.com/agreement.
 */

//export { default } from './plugin';

import { Plugin } from '@nocobase/client';
import { ObjectItemBlock } from './ObjectItemBlock';

export class ObjectItemBlockPlugin extends Plugin {
  async load() {
    // 1. Đăng ký component vào hệ thống
    this.app.addComponents({
      ObjectItemBlock,
    });

    // 2. Thêm vào Schema Initializer (Menu "Add block")
    this.app.schemaSettingsManager.add('page:addBlock', [
      {
        name: 'objectItemBlock',
        type: 'item',
        title: 'Object Item Block',
        component: 'ObjectItemBlock',
      },
    ]);
  }
}

export default ObjectItemBlockPlugin;
