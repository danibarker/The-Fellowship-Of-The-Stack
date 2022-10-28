function base64ToBlob(base64, mime = "") {
  const sliceSize = 1024;
  const byteChars = window.atob(base64);
  const byteArrays = [];

  for (
    let offset = 0, len = byteChars.length;
    offset < len;
    offset += sliceSize
  ) {
    const slice = byteChars.slice(offset, offset + sliceSize);

    const byteNumbers = new Array(slice.length);
    for (let i = 0; i < slice.length; i += 1) {
      byteNumbers[i] = slice.charCodeAt(i);
    }

    const byteArray = new Uint8Array(byteNumbers);

    byteArrays.push(byteArray);
  }

  return new Blob(byteArrays, { type: mime });
}
function convertCanvasToBlob(img) {
  // convert canvas image back to a base64 image
  const jpegFile = img.toDataURL();
  // change base64 image to plain base64 data
  const base64 = jpegFile.replace(/^data:image\/(png|jpeg);base64,/, "");
  // convert base64 data into an jpeg image that AWS can handle
  const jpegBlob = base64ToBlob(base64, "image/jpeg");
  return jpegBlob;
}
function crop(url, aspectRatio) {
  // we return a Promise that gets resolved with our canvas element
  return new Promise((resolve) => {
    // this image will hold our source image data
    const inputImage = new Image();

    // we want to wait for our image to load
    inputImage.onload = () => {
      // let's store the width and height of our image
      const inputWidth = inputImage.naturalWidth;
      const inputHeight = inputImage.naturalHeight;

      // get the aspect ratio of the input image
      const inputImageAspectRatio = inputWidth / inputHeight;

      // if it's bigger than our target aspect ratio
      let outputWidth = inputWidth;
      let outputHeight = inputHeight;
      if (inputImageAspectRatio > aspectRatio) {
        outputWidth = inputHeight * aspectRatio;
      } else if (inputImageAspectRatio < aspectRatio) {
        outputHeight = inputWidth / aspectRatio;
      }

      // calculate the position to draw the image at
      const outputX = (outputWidth - inputWidth) * 0.5;
      const outputY = (outputHeight - inputHeight) * 0.5;

      // create a canvas that will present the output image
      const outputImage = document.createElement("canvas");

      // set it to the same size as the image
      outputImage.width = outputWidth;
      outputImage.height = outputHeight;

      // draw our image at position 0, 0 on the canvas
      const ctx = outputImage.getContext("2d");
      ctx.drawImage(inputImage, outputX, outputY);
      const jpegBlob = convertCanvasToBlob(outputImage);
      resolve(jpegBlob);
    };

    // start loading our image
    inputImage.src = url;
  });
}

export default crop;
