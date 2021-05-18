class SliderModel {
  String svgAsset;
  String heading;
  String body;

  SliderModel({this.svgAsset, this.heading, this.body});

  void setsvgAsset(String getsvgAsset) {
    svgAsset = getsvgAsset;
  }

  void setHeading(String getHeading) {
    heading = getHeading;
  }

  void setBody(String getBody) {
    body = getBody;
  }

  String getsvgAsset() {
    return svgAsset;
  }

  String getHeading() {
    return heading;
  }

  String getBody() {
    return body;
  }
}

List<SliderModel> getSlides() {
  // ignore: deprecated_member_use
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setsvgAsset('assets/Frame 22.svg');
  sliderModel
      .setHeading('Track your foot and conform your footprint, with c-tracker');
  sliderModel.setBody(
      'A customer can scan merchants QR code and confirm their footprint.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setsvgAsset('assets/Frame 23.svg');
  sliderModel.setHeading('Wash Your Hands');
  sliderModel.setBody(
      'Clean your hands often. Use soap and water, or an alcohol-based hand rub.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setsvgAsset('assets/Frame 24.svg');
  sliderModel.setHeading('Wear a mask');
  sliderModel.setBody(
      'Wear a mask when physical distancing is not possible. Don’t touch your eyes, nose or mouth.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setsvgAsset('assets/Frame 25.svg');
  sliderModel.setHeading('maintain social distancing');
  sliderModel.setBody(
      'Avoid crowds. Maintain a safe distance from anyone who is coughing or sneezing.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
