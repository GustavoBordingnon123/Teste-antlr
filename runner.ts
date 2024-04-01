import { CharStreams, CommonTokenStream } from "antlr4ts";
import { calcParser } from "./generated/calcParser";
import { calcLexer } from "./generated/calcLexer";
import * as fs from "fs";

// Create the lexer and parser
const code = fs.readFileSync("EXAMPLE.txt", "utf8");
const inputStream = CharStreams.fromString(code);
const lexer = new calcLexer(inputStream);
const tokenStream = new CommonTokenStream(lexer);
const parser = new calcParser(tokenStream);
const tree = parser.equation();