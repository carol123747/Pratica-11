#!/bin/bash

# Baixar JFlex e JCup (se necessário)
wget https://repo1.maven.org/maven2/de/jflex/jflex/1.8.2/jflex-1.8.2.jar -O jflex.jar
wget https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b-20160615/java-cup-11b-20160615.jar -O jcup.jar

# Gerar analisador léxico
java -cp jflex.jar jflex.Main ExprLexer.flex

# Gerar analisador sintático
java -cp jcup.jar java_cup.Main -parser ExprParser ExprParser.cup

# Compilar tudo
javac -cp .:jcup.jar *.java

# Executar passando entrada.txt
java -cp .:jcup.jar ExprParser entrada.txt
