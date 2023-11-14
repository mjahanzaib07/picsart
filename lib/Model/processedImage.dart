class ProcessedImage {
  List<double>? balance;
  List<double>? clarity;
  double? cognative;
  List<double>? complexity;
  double? exciting;
  List<double>? focus;
  String? imagePath;
  double get value => (105.2838*balance![0])-(678.0673*clarity![0])-(854.6259*cognative!)+(110.1255*exciting!)-(29.6499*focus![0])+81304.23 ;

  ProcessedImage(
      {this.balance,
        this.clarity,
        this.cognative,
        this.complexity,
        this.exciting,
        this.focus,
        this.imagePath});

  ProcessedImage.fromJson(Map<String, dynamic> json) {
    balance = json['Balance'].cast<double>();
    clarity = json['Clarity'].cast<double>();
    cognative = json['Cognative'].toDouble();
    complexity = json['Complexity'].cast<double>();
    exciting = json['Exciting'].toDouble();
    focus = json['Focus'].cast<double>();
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Balance'] = this.balance;
    data['Clarity'] = this.clarity;
    data['Cognative'] = this.cognative;
    data['Complexity'] = this.complexity;
    data['Exciting'] = this.exciting;
    data['Focus'] = this.focus;
    data['image_path'] = this.imagePath;
    return data;
  }
}