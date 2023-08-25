class LeaveData {
  int? sickLeave;
  int? earnedLeave;
  dynamic casualLeave;
  int? compensatoryOff;
  int? onDuty;
  int? workFromHome;

  LeaveData({
    this.sickLeave,
    this.earnedLeave,
    this.casualLeave,
    this.compensatoryOff,
    this.onDuty,
    this.workFromHome,
  });

  LeaveData.fromJson(Map<String, dynamic> json) {
    sickLeave = json['Sick Leave'];
    earnedLeave = json['Earned Leave'];
    casualLeave = json['Casual Leave'];
    compensatoryOff = json['Compensatory Off'];
    onDuty = json['On Duty'];
    workFromHome = json['Work From Home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Sick Leave'] = sickLeave;
    data['Earned Leave'] = earnedLeave;
    data['Casual Leave'] = casualLeave;
    data['Compensatory Off'] = compensatoryOff;
    data['On Duty'] = onDuty;
    data['Work From Home'] = workFromHome;
    return data;
  }
}
