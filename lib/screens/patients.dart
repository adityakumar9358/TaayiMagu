class Patient {
  final String name;
  final String phno;
  final int age;
  final int weight;
  final String height;
  final DateTime LastAppointment;
  final DateTime firstAncDate;
  final DateTime dueDate;
  final DateTime ComplainDateTime;
  final double hb;
  final int pulse;
  final int spo2;
  final int gluc;
  final int fhr;


  Patient(this.name,this.phno,this.age,this.weight,this.height, this.LastAppointment,this.hb,this.pulse,this.spo2,this.gluc,this.fhr,this.dueDate,this.firstAncDate,this.ComplainDateTime);
}

final List<Patient> patients = [
    Patient('Aishwarya','+91 8945678910',30,70,'5ft 7in', DateTime.parse('2023-08-15 15:30:00'),10.0,75,98,90,140,DateTime.parse('2023-08-15 15:30:00'),DateTime.parse('2023-08-15 15:30:00'),DateTime.parse('2023-08-15 15:30:00')),
    Patient('Priya','+91 7945675610',28,60,'5ft 5in', DateTime.parse('2023-08-20 10:15:00'),9.6,85,98,90,140,DateTime.parse('2023-08-20 10:15:00'),DateTime.parse('2023-08-20 10:15:00'),DateTime.parse('2023-08-20 10:15:00')),
    Patient('Neha','+91 9945673210',31,50,'5ft 3in', DateTime.parse('2023-08-25 14:00:00'),12.9,95,93,90,140,DateTime.parse('2023-08-25 14:00:00'), DateTime.parse('2023-08-25 14:00:00'),DateTime.parse('2023-08-25 14:00:00')),
    Patient('Deepika','+91 8945978910',26,55,'5ft 4in', DateTime.parse('2023-09-01 11:30:00'),13.2,90,98,160,140,DateTime.parse('2023-09-01 11:30:00'), DateTime.parse('2023-09-01 11:30:00'),DateTime.parse('2023-09-01 11:30:00')),
    Patient('Ananya','+91 9945678910',32,60,'5ft 2in', DateTime.parse('2023-09-05 10:15:00'),14.5,105,98,90,110,DateTime.parse('2023-09-05 10:15:00'), DateTime.parse('2023-09-05 10:15:00'),DateTime.parse('2023-09-05 10:15:00')),
    Patient('Pooja','+91 6945678910',31,56,'5ft 6in', DateTime.parse('2023-09-07 16:30:00'),15.1,65,98,90,100,DateTime.parse('2023-09-07 16:30:00'),DateTime.parse('2023-09-07 16:30:00'),DateTime.parse('2023-09-07 16:30:00')),
    Patient('Radhika','+91 7945678910',26,50,'5ft 3in', DateTime.parse('2023-09-10 12:15:00'),15.5,96,97,90,150,DateTime.parse('2023-09-10 12:15:00'),DateTime.parse('2023-09-10 12:15:00'),DateTime.parse('2023-09-10 12:15:00')),
    Patient('Sanya','+91 9945678910',27,60,'5ft 4in', DateTime.parse('2023-09-13 15:10:00'),16.2,97,99,80,140,DateTime.parse('2023-09-13 15:10:00'),DateTime.parse('2023-09-13 15:10:00'),DateTime.parse('2023-09-13 15:10:00')),
    Patient('Kavita','+91 6945678910',29,70,'5ft 2in', DateTime.parse('2023-09-14 13:01:00'),13.6,98,98,99,144,DateTime.parse('2023-09-14 13:01:00'),DateTime.parse('2023-09-14 13:01:00'),DateTime.parse('2023-09-14 13:01:00')),
    Patient('Sneha','+91 8945678910',33,65,'5ft 6in', DateTime.parse('2023-09-30 11:35:00'),12.9,99,99,70,157,DateTime.parse('2023-09-30 11:35:00'),DateTime.parse('2023-09-30 11:35:00'),DateTime.parse('2023-09-30 11:35:00')),
    Patient('Meera','+91 7945678910',31,50,'5ft 2in', DateTime.parse('2023-10-02 15:05:00'),0.0,90,95,78,141,DateTime.parse('2023-10-02 15:05:00'),DateTime.parse('2023-10-02 15:05:00'),DateTime.parse('2023-10-02 15:05:00')),
  ];