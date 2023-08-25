class LeaveDetailsData {
  String? status;
  String? message;
  List<Data>? data;

  LeaveDetailsData({this.status, this.message, this.data});

  LeaveDetailsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? leaverequestDate;
  String? startDate;
  String? endDate;
  String? totalLeaveDatetime;
  String? leaveReason;
  int? reviewerUserId;
  String? reviewedDate;
  String? reviewerComments;
  String? status;
  String? isRevoked;
  String? name;
  String? userCode;
  String? leaveType;
  String? reviewerName;
  String? reviewerDesignation;
  String? reviewerShortName;
  String? userShortName;

  Data(
      {this.id,
      this.leaverequestDate,
      this.startDate,
      this.endDate,
      this.totalLeaveDatetime,
      this.leaveReason,
      this.reviewerUserId,
      this.reviewedDate,
      this.reviewerComments,
      this.status,
      this.isRevoked,
      this.name,
      this.userCode,
      this.leaveType,
      this.reviewerName,
      this.reviewerDesignation,
      this.reviewerShortName,
      this.userShortName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaverequestDate = json['leaverequest_date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalLeaveDatetime = json['total_leave_datetime'];
    leaveReason = json['leave_reason'];
    reviewerUserId = json['reviewer_user_id'];
    reviewedDate = json['reviewed_date'];
    reviewerComments = json['reviewer_comments'];
    status = json['status'];
    isRevoked = json['is_revoked'];
    name = json['name'];
    userCode = json['user_code'];
    leaveType = json['leave_type'];
    reviewerName = json['reviewer_name'];
    reviewerDesignation = json['reviewer_designation'];
    reviewerShortName = json['reviewer_short_name'];
    userShortName = json['user_short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['leaverequest_date'] = leaverequestDate;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total_leave_datetime'] = totalLeaveDatetime;
    data['leave_reason'] = leaveReason;
    data['reviewer_user_id'] = reviewerUserId;
    data['reviewed_date'] = reviewedDate;
    data['reviewer_comments'] = reviewerComments;
    data['status'] = status;
    data['is_revoked'] = isRevoked;
    data['name'] = name;
    data['user_code'] = userCode;
    data['leave_type'] = leaveType;
    data['reviewer_name'] = reviewerName;
    data['reviewer_designation'] = reviewerDesignation;
    data['reviewer_short_name'] = reviewerShortName;
    data['user_short_name'] = userShortName;
    return data;
  }
}
