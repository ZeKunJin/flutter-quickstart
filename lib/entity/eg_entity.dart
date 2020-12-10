class EgEntity {
  int code;
  List<EgArrayEntity> data;
  int uuid;
  int iT;

  EgEntity({this.code, this.data, this.uuid, this.iT});

  EgEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<EgArrayEntity>();
      json['data'].forEach((v) {
        data.add(new EgArrayEntity.fromJson(v));
      });
    }
    uuid = json['uuid'];
    iT = json['_t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['uuid'] = this.uuid;
    data['_t'] = this.iT;
    return data;
  }
}

class EgArrayEntity {
  String id;
  int createTime;
  int updateTime;
  String image;
  int isJump;
  bool isWrite;
  String shufflingContent;

  EgArrayEntity(
      {this.id,
      this.createTime,
      this.updateTime,
      this.image,
      this.isJump,
      this.isWrite,
      this.shufflingContent});

  EgArrayEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    image = json['image'];
    isJump = json['isJump'];
    isWrite = json['isWrite'];
    shufflingContent = json['shufflingContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['image'] = this.image;
    data['isJump'] = this.isJump;
    data['isWrite'] = this.isWrite;
    data['shufflingContent'] = this.shufflingContent;
    return data;
  }
}
