module.exports = function(grunt) {

  "use strict";

  grunt.initConfig({

    srcFiles: [
      "src/**/*.purs",
      "bower_components/**/src/**/*.purs"
    ],

    mainFile: "dist/Main.js",

    psc: {
      options: {
        main: "Hello",
        modules: ["Hello"]
      },
      all: {
        src: ["<%=srcFiles%>"],
        dest: "<%=mainFile%>"
      }
    },

    dotPsci: ["<%=srcFiles%>"],

    execute: {
        main: {
            src: ["dist/Main.js"]
        }
    }
  });

  grunt.loadNpmTasks("grunt-purescript");
  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-execute")
 
  grunt.registerTask("default", ["psc:all", "dotPsci"]);
  grunt.registerTask("run", ["execute:main"]);
};
