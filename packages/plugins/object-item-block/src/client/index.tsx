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
import { ObjectItemBlockInitializer } from './ObjectItemBlockInitializer';

export class ObjectItemBlockPlugin extends Plugin {
  async load() {
    // 1. Đăng ký component vào hệ thống
    this.app.addComponents({
      ObjectItemBlock,
      ObjectItemBlockInitializer,
    });

    // 2. Thêm vào Schema Initializer (Menu "Add block")
    this.app.schemaInitializerManager.addItem('page:addBlock', 'otherBlocks.objectItemBlock', {
      title: 'Object Item Block',
      Component: 'ObjectItemBlockInitializer',
    });
  }
}

export default ObjectItemBlockPlugin;
