/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

abstract class EntityBase {
  int id;

  EntityBase(this.id);

  EntityBase.fromJson(Map<String, dynamic> json) : id = json['id'];
}
