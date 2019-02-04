GRAALVM_HOME=/home/evacchi/.jabba/jdk/graalvm@1.0.0-11
NATIVE_IMAGE=$GRAALVM_HOME/bin/native-image
PROJECT=/home/evacchi/Devel/redhat/pr/jbpm-graal/jbpm-graal-playground
MAVEN=/home/evacchi/.m2/repository/

cp=(
    $PROJECT/target/classes
    $MAVEN/org/jbpm/jbpm-flow-builder/7.18.0-SNAPSHOT/jbpm-flow-builder-7.18.0-20190131.164320-8.jar
    $MAVEN/org/kie/soup/kie-soup-project-datamodel-commons/7.18.0-SNAPSHOT/kie-soup-project-datamodel-commons-7.18.0-20190131.095622-5.jar
    $MAVEN/org/kie/soup/kie-soup-project-datamodel-api/7.18.0-SNAPSHOT/kie-soup-project-datamodel-api-7.18.0-20190131.095613-5.jar
    $MAVEN/org/drools/drools-compiler/7.18.0-SNAPSHOT/drools-compiler-7.18.0-20190204.091150-12.jar
    $MAVEN/org/kie/soup/kie-soup-maven-support/7.18.0-SNAPSHOT/kie-soup-maven-support-7.18.0-20190131.095633-6.jar
    $MAVEN/org/antlr/antlr-runtime/3.5.2/antlr-runtime-3.5.2.jar
    $MAVEN/org/eclipse/jdt/core/compiler/ecj/4.6.1/ecj-4.6.1.jar
    $MAVEN/com/thoughtworks/xstream/xstream/1.4.10/xstream-1.4.10.jar
    $MAVEN/xmlpull/xmlpull/1.1.3.1/xmlpull-1.1.3.1.jar
    $MAVEN/xpp3/xpp3_min/1.1.4c/xpp3_min-1.1.4c.jar
    $MAVEN/org/drools/drools-core/7.18.0-SNAPSHOT/drools-core-7.18.0-20190204.090808-12.jar
    $MAVEN/commons-codec/commons-codec/1.10/commons-codec-1.10.jar
    $MAVEN/org/kie/kie-api/7.18.0-SNAPSHOT/kie-api-7.18.0-20190201.200137-11.jar
    $MAVEN/org/kie/kie-internal/7.18.0-SNAPSHOT/kie-internal-7.18.0-20190201.200158-10.jar
    $MAVEN/org/mvel/mvel2/2.4.3.Final/mvel2-2.4.3.Final.jar
    $MAVEN/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar
    $MAVEN/org/jbpm/jbpm-flow/7.18.0-SNAPSHOT/jbpm-flow-7.18.0-20190131.164224-8.jar
    $MAVEN/org/kie/soup/kie-soup-commons/7.18.0-SNAPSHOT/kie-soup-commons-7.18.0-20190131.095601-6.jar
    $MAVEN/org/kie/kie-dmn-api/7.18.0-SNAPSHOT/kie-dmn-api-7.18.0-20190204.092125-12.jar
    $MAVEN/org/kie/kie-dmn-feel/7.18.0-SNAPSHOT/kie-dmn-feel-7.18.0-20190204.092156-12.jar
    $MAVEN/org/kie/kie-dmn-model/7.18.0-SNAPSHOT/kie-dmn-model-7.18.0-20190204.092114-12.jar
    $MAVEN/org/antlr/antlr4-runtime/4.5.3/antlr4-runtime-4.5.3.jar
    $MAVEN/org/drools/drlx-parser/7.18.0-SNAPSHOT/drlx-parser-7.18.0-20190131.155344-10.jar
    $MAVEN/ch/obermuhlner/big-math/2.0.1/big-math-2.0.1.jar
    $MAVEN/org/kie/kie-dmn-core/7.18.0-SNAPSHOT/kie-dmn-core-7.18.0-20190204.092427-12.jar
    $MAVEN/org/kie/kie-dmn-backend/7.18.0-SNAPSHOT/kie-dmn-backend-7.18.0-20190204.092222-12.jar
    $MAVEN/org/drools/drools-canonical-model/7.18.0-SNAPSHOT/drools-canonical-model-7.18.0-20190204.091904-12.jar
    $MAVEN/org/drools/drools-model-compiler/7.18.0-SNAPSHOT/drools-model-compiler-7.18.0-20190204.092053-12.jar
    $MAVEN/com/google/protobuf/protobuf-java/3.6.1/protobuf-java-3.6.1.jar
    $MAVEN/org/apache/commons/commons-lang3/3.6/commons-lang3-3.6.jar
)

$NATIVE_IMAGE -H:ReflectionConfigurationFiles=reflection.json -classpath ${(j.:.)${cp}} org.jbpm.graal.playground.Main
#time java -classpath ${(j.:.)${cp}} org.jbpm.graal.playground.Main


