/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('generator-nodemodule:app', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../app'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withOptions({ 'skip-install': true })
      .withPrompt({
        modulename: "testmodule"
      })
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'package.json',
      '.gitignore',
      '.npmignore',
      '.travis.yml',
      'LICENSE',
      'README.md',
      'Gruntfile.coffee',
      '_src/index.coffee',
      '_src/lib/testmodule.coffee',
      '_src/lib/redisconnector.coffee',
      '_src/test/main.coffee'
    ]);
  });
   it('file content', function () {
    var rgx = new RegExp( "# testmodule", "gi" );
    assert.fileContent('_src/lib/testmodule.coffee', rgx );
  });
  
});
