class LeaveBalanceData {
  String? status;
  String? message;
  Data? data;

  LeaveBalanceData({this.status, this.message, this.data});

  LeaveBalanceData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? sickLeave;
  int? earnedLeave;
  double? casualLeave;
  int? compensatoryOff;
  int? onDuty;
  int? workFromHome;

  Data(
      {this.sickLeave,
      this.earnedLeave,
      this.casualLeave,
      this.compensatoryOff,
      this.onDuty,
      this.workFromHome});

  Data.fromJson(Map<String, dynamic> json) {
    sickLeave = json['Sick Leave'];
    earnedLeave = json['Earned Leave'];
    casualLeave = json['Casual Leave'];
    compensatoryOff = json['Compensatory Off'];
    onDuty = json['On Duty'];
    workFromHome = json['Work From Home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Sick Leave'] = sickLeave;
    data['Earned Leave'] = earnedLeave;
    data['Casual Leave'] = casualLeave;
    data['Compensatory Off'] = compensatoryOff;
    data['On Duty'] = onDuty;
    data['Work From Home'] = workFromHome;
    return data;
  }
}
