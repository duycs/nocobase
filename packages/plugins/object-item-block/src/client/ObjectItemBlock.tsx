/**
 * This file is part of the NocoBase (R) project.
 * Copyright (c) 2020-2024 NocoBase Co., Ltd.
 * Authors: NocoBase Team.
 *
 * This project is dual-licensed under AGPL-3.0 and NocoBase Commercial License.
 * For more information, please refer to: https://www.nocobase.com/agreement.
 */

import React from 'react';
import { useRequest } from '@nocobase/client';
import { Card, List, Spin } from 'antd';

export const ObjectItemBlock = () => {
  // Lấy dữ liệu từ bảng 'objects_items'
  const { data, loading } = useRequest({
    url: 'vehicle_objects_items:list',
    params: {
      paginate: false,
    },
  });

  if (loading) return <Spin />;

  const items = (data as any)?.data || [];

  return (
    <Card title="Danh sách Object Items">
      <List
        dataSource={items}
        renderItem={(item: any) => <List.Item key={item.id}>{item.title || item.name}</List.Item>}
      />
    </Card>
  );
};
