import '../../../res.dart';

class Model {
  Model({required this.text, required this.image});
  String image;
  String text;
}

List<Model> modelList = [
  Model(
      text:
          'Carefully selecting the most qualified\nand experienced medical professional\nto ensure you receive the highest \nstandard of healthcare and treatment',
      image: Res.surance),
  Model(
      text:
          "Utilizing cutting-edge technological\n advancements and incorporating modern,\nstate-of-the-art technologies in the field of\n medical treatment and healthcare.",
      image: Res.reality),
  Model(
      text:
          "Constantly monitoring and meticulously\nkeeping a record of your treatment progress\nto ensure the best possible outcomes and\n adjustments as necessary",
      image: Res.watch)
];
