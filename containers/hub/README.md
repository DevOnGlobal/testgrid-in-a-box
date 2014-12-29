Selenium Grid hub
=================

Out-of-the-box Selenium Grid hub image.


Usage
-----

To download the latest version from Docker Hub, just execute the following command:

    docker pull prowareness/selenium-hub

To create the image `prowareness/selenium-hub`, execute the following command on the containers/hub/ folder:

    docker build -t prowareness/selenium-hub .

You can now push your new image to the registry:

    docker push prowareness/selenium-hub


Running your Selenium Grid image
--------------------------------

Start your image binding the external ports 4444 in all interfaces to your container:

    docker run -d -p 80:80 -p 4444:4444 tutum/lamp

Test your deployment:

    curl http://localhost:4444/

You should see a page from Selenium Grid. That's all!

Linking Selenium node containers to the grid
--------------------------------------------

You can use the docker images prowareness/selenium-node-ff and prowareness/selenium-node-chrome to create
a grid with the hub and one or more nodes. See the description of the node images in how to obtain those.

To start a grid with a Firefox node and a Chrome node, execute the following commands:

Start the hub and give it a name:

    docker run -d -p 4444:4444 --name grid-hub prowareness/selenium-hub

Start the Firefox node and link it to the hub:

    docker run -d --link grid-hub:hub --name grid-ff prowareness/selenium-node-ff

Start the Chrome node and link it to the hub:

    docker run -d --link grid-hub:hub --name grid-chrome prowareness/selenium-node-chrome


Access the grid using RemoteWebDriver
-------------------------------------

Point the RemoteWebDriver to the url http://localhost:4444/wd/hub. You can choose your browser using the DesiredCapabilities parameter
in the constructor.

** By http://www.prowareness.nl **
