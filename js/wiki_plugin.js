function WikiPlugin() {
  throw new Error('This is a static class');
};

WikiPlugin.loadDatabase = function(databaseFiles) {
  for (var i = 0; i < databaseFiles.length; i++) {
    var name = databaseFiles[i].name;
    var src = databaseFiles[i].src;
    DataManager.loadDataFile(name, src);
  }
};

WikiPlugin.isDatabaseLoaded = function(databaseFiles) {
  DataManager.checkError();
  for (var i = 0; i < databaseFiles.length; i++) {
    if (!window[databaseFiles[i].name]) {
      return false;
    }
  }
  return true;
};

WikiPlugin.tkoolMap = function(databaseFiles) {
  WikiPlugin.loadDatabase(databaseFiles);
  var checkLoaded = function() {
    if (!WikiPlugin.isDatabaseLoaded(databaseFiles)) {
      setTimeout(checkLoaded,1000);
    } else {
      SceneManager.preferableRendererType = function() {return "canvas"};
      $dataCommonEvents = [];
      $dataTroops = [];
      Scene_Map.prototype.create = function() {
        Scene_Base.prototype.create.call(this);
        this._transfer = $gamePlayer.isTransferring();
      };
      $dataSystem.partyMembers = [];
      DataManager.createGameObjects();
      //DataManager.selectSavefileForNewGame();
      $gameParty.setupStartingMembers();
      $gamePlayer.reserveTransfer(-1, 8, 6);
      $gamePlayer.setTransparent(true);
      $gamePlayer.setThrough(true);
      $gameSystem.disableMenu();
      SceneManager.run(Scene_Map);
    }
  };
  checkLoaded();
};











/**
 * @static
 * @method _createCanvas
 * @private
 */
Graphics._createCanvas = function() {
    this._canvas = document.getElementById("GameCanvas");
    //this._canvas.id = 'GameCanvas';
    //this._updateCanvas();
    //document.body.appendChild(this._canvas);
};

/**
 * @static
 * @method _updateCanvas
 * @private
 */
Graphics._updateCanvas = function() {
    this._canvas.width = this._width;
    this._canvas.height = this._height;
    this._canvas.style.zIndex = 1;
    //this._centerElement(this._canvas);
};

/**
 * @static
 * @method _createErrorPrinter
 * @private
 */
Graphics._createErrorPrinter = function() {
    this._errorPrinter = document.getElementById("ErrorPrinter");
    this._updateErrorPrinter();
};

/**
 * @static
 * @method _updateErrorPrinter
 * @private
 */
Graphics._updateErrorPrinter = function() {
    this._errorPrinter.width = this._width * 0.9;
    this._errorPrinter.height = 40;
    this._errorPrinter.style.textAlign = 'center';
    this._errorPrinter.style.textShadow = '1px 1px 3px #000';
    this._errorPrinter.style.fontSize = '20px';
    this._errorPrinter.style.zIndex = 99;
    //this._centerElement(this._errorPrinter);
};

/**
 * @static
 * @method _createVideo
 * @private
 */
Graphics._createVideo = function() {
    this._video = document.createElement('video');
    this._video.id = 'GameVideo';
    this._video.style.opacity = 0;
    this._updateVideo();
    document.body.appendChild(this._video);
};

/**
 * @static
 * @method _updateVideo
 * @private
 */
Graphics._updateVideo = function() {
    this._video.width = this._width;
    this._video.height = this._height;
    this._video.style.zIndex = 2;
    //this._centerElement(this._video);
    this._overwrapElement(this._video);
};


/**
 * @static
 * @method _centerElement
 * @param {HTMLElement} element
 * @private
 */
Graphics._overwrapElement = function(element) {
    var width = element.width * this._realScale;
    var height = element.height * this._realScale;
    element.style.position = 'absolute';
    //element.style.margin = 'auto';
    var box = getDOMObjectPosition(this._canvas);
    element.style.top = box.top;
    element.style.left = box.left;
    element.style.right = 0;
    element.style.bottom = 0;
    element.style.width = width + 'px';
    element.style.height = height + 'px';
};


/**
 * @static
 * @method _createUpperCanvas
 * @private
 */
Graphics._createUpperCanvas = function() {
    this._upperCanvas = document.createElement('canvas');
    this._upperCanvas.id = 'UpperCanvas';
    this._updateUpperCanvas();
    document.body.appendChild(this._upperCanvas);
};

/**
 * @static
 * @method _updateUpperCanvas
 * @private
 */
Graphics._updateUpperCanvas = function() {
    this._upperCanvas.width = this._width;
    this._upperCanvas.height = this._height;
    this._upperCanvas.style.zIndex = 3;
    //this._centerElement(this._upperCanvas);
    this._overwrapElement(this._upperCanvas);
};


/**
 * @static
 * @method _createModeBox
 * @private
 */
Graphics._createModeBox = function() {
    var box = document.createElement('div');
    box.id = 'modeTextBack';
    //box.style.position = 'absolute';
    box.style.left = '5px';
    box.style.top = '5px';
    box.style.width = '119px';
    box.style.height = '58px';
    box.style.background = 'rgba(0,0,0,0.2)';
    box.style.zIndex = 9;
    box.style.opacity = 0;

    var text = document.createElement('div');
    text.id = 'modeText';
    //text.style.position = 'absolute';
    text.style.left = '0px';
    text.style.top = '41px';
    text.style.width = '119px';
    text.style.fontSize = '12px';
    text.style.fontFamily = 'monospace';
    text.style.color = 'white';
    text.style.textAlign = 'center';
    text.style.textShadow = '1px 1px 0 rgba(0,0,0,0.5)';
    text.innerHTML = this.isWebGL() ? 'WebGL mode' : 'Canvas mode';

    document.body.appendChild(box);
    box.appendChild(text);

    this._modeBox = box;
};

var getDOMObjectPosition = function(obj, stopObj) {
  var info = {
    left: 0,
    top: 0,
    width: obj.width ? obj.width : obj.offsetWidth,
    height: obj.height ? obj.height : obj.offsetHeight
  };
  while (obj && obj != stopObj) {
    info.left += obj.offsetLeft;
    info.left += obj.style.borderLeftWidth ? parseInt(obj.style.borderLeftWidth, 10) : 0;
    info.top += obj.offsetTop;
    info.top += obj.style.borderTopWidth ? parseInt(obj.style.borderTopWidth, 10) : 0;
    obj = obj.offsetParent;
  }
  return info;
};
