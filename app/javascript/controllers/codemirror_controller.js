import { Controller } from "@hotwired/stimulus"
import { useWindowResize } from 'stimulus-use'

// Connects to data-controller="codemirror"
export default class extends Controller {
  static values = {
    lang: String
  }
  windowResize({ width, height, event }) {
    console.log("ola");
    if (this.editor) {
      console.log("dog");
      this.editor.setSize(width/2,null);
    }

  }
  connect() {
    useWindowResize(this)
    setTimeout(() => {
      var html_value;

    var language = this.langValue
    var mode = "";

    // Map programming language to CodeMirror mode
    switch (language) {
      case "c":
      case "c++":
      case "c#":
        mode = "text/x-csrc";
        break;
      case "go":
        mode = "text/x-go";
        break;
      case "java":
        mode = "text/x-java";
        break;
      case "javascript":
        mode = "text/javascript";
        break;
      case "kotlin":
        mode = "text/x-kotlin";
        break;
      case "matlab":
        mode = "text/x-octave";
        break;
      case "php":
        mode = "application/x-httpd-php";
        break;
      case "python":
        mode = "text/x-python";
        break;
      case "r":
        mode = "text/x-rsrc";
        break;
      case "ruby":
        mode = "text/x-ruby";
        break;
      case "rust":
        mode = "text/x-rustsrc";
        break;
      case "swift":
        mode = "text/x-swift";
        break;
      case "typescript":
        mode = "text/typescript";
        break;
      default:
        mode = "text/plain";
    }

      this.editor = CodeMirror.fromTextArea(document.getElementById("code_review_user_answer"), {
      styleActiveLine: true,
      lineNumbers: true,
      matchBrackets: true,
      autoCloseBrackets: true,
      autoCloseTags: true,
      mode: mode,
    });
    this.editor.setSize(window.screen.width/2,null);
    // all your js code
    }, 1000)


  }
}
