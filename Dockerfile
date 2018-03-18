FROM hotswapagent/tomee
RUN mkdir -p /extra_class_path
RUN mkdir -p /udgerdb
COPY ./target/udger-webservice.war ${DEPLOYMENT_DIR}
COPY ./udgerdb_v3.dat /udgerdb/
ENV JAVA_OPTS="-Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -XXaltjvm=dcevm -agentlib:jdwp=transport=dt_socket,server=y,address=8000,suspend=n -javaagent:/opt/hotswap-agent/hotswap-agent.jar -Dextra.class.path=/extra_class_path"