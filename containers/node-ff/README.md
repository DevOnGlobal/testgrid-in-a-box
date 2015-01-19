prowareness/selenium-node-ff
============================

Out-of-the-box Selenium image with Firefox. Can be used as a standalone instance or as a node for Selenium Grid.

Usage
-----

To download the latest version from Docker Hub, just execute the following command:

    docker pull prowareness/selenium-node-ff

To create the image `prowareness/selenium-node-ff`, execute the following command on the containers/node-ff/ folder:

    docker build -t prowareness/selenium-node-ff .

You can now push your new image to the registry:

    docker push prowareness/selenium-node-ff

Running your image as a stand-alone solution
--------------------------------------------

Start a container using the Firefox image:

    docker run -d --p 4444:4444 --name ff-standalone prowareness/selenium-node-ff

Thats it! You can now use it by providing your RemoteWebDriver class with the url http://localhost:4444/wd/hub

Running your image in combination with hub image
--------------------------------------------

You can use the docker image prowareness/selenium-hub to create a grid with the hub and one or more nodes. 
See the description of the hub image for more information.

To start a grid with a Firefox node, execute the following commands:

Start the hub and give it a name:

    docker run -d -p 4444:4444 --name grid-hub prowareness/selenium-hub

Start the Firefox node and link it to the hub:

    docker run -d --link grid-hub:hub --name grid-ff prowareness/selenium-node-ff

Thats it! You can now use it by providing your RemoteWebDriver class with the url http://localhost:4444/wd/hub

Environment variables
---------------------

There are a couple of environment variables to customise of needed:

### `SCREEN_DIMENSION` ###

Use this environment variable to set screen size and color depth.

Format: `<width>x<height>x<color_depth>`

Default: `1920x1080x24`

### `MAX_INSTANCES` ###

Use this environment variable to set the maximum number of browser instances.

Format: `<number>`

Default: 5

** By http://www.prowareness.nl **
