import blobDetection.*;
BlobDetection theBlobDetection;

import processing.video.*;
Capture cam;

import milchreis.imageprocessing.*;

void setup()
{
  theBlobDetection = new BlobDetection(640, 480);
  theBlobDetection.setPosDiscrimination(false);
  theBlobDetection.setThreshold(0.38f);
  size(640, 480);
  String[] cameras = Capture.list();
  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } else if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw()
{
   if (cam.available() == true) {
    cam.read();
  }
  PImage processedImage = null;
  processedImage = CannyEdgeDetector.apply(cam);
  image(processedImage, 0, 0, width, height);
  theBlobDetection.computeBlobs(cam.pixels);
  drawBlobsAndEdges(true, true);
}

void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges)
{
  noFill();
  Blob b;
  EdgeVertex eA, eB;
  for (int n=0 ; n<theBlobDetection.getBlobNb() ; n++)
  {
    b=theBlobDetection.getBlob(n);
    if (b!=null)
    {
      if (drawEdges)
      {
        strokeWeight(1);
        stroke(70,200,150);
        for (int m=0;m<b.getEdgeNb();m++)
        {
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null)
            line(
            eA.x*width, eA.y*height, 
            eB.x*width, eB.y*height
              );
        }
      }
      if (drawBlobs)
      {
        strokeWeight(2);
        stroke(200, 100, 70);
        rect(
        b.xMin*width, b.yMin*height, 
        b.w*width, b.h*height
          );
      }
    }
  }
}
