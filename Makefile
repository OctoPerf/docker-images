TAG ?= latest

# Images built on the JDK: one build per JDK line, tagged with it.
#   java, java-ssh, jmeter: octoperf/<image>:jdk21, :jdk25
#   playwright:             octoperf/playwright:<TAG>-jdk21, :<TAG>-jdk25  (TAG = the Playwright version)
# The line in LATEST_JDK is also tagged :latest (and :<TAG> when TAG is set).
JDKS ?= 21 25
LATEST_JDK ?= 25
JDK_IMAGES := java java-ssh jmeter playwright

jdk_tag = $(if $(filter playwright,$(1)),$(TAG)-jdk$(2),jdk$(2))
aliases = latest $(filter-out latest,$(TAG))

java-ssh.docker.build playwright.docker.build: java.docker.build
jmeter.docker.build: java-ssh.docker.build

# Only java pulls its base (ubuntu): the others build FROM the local jdk<N> tag of their parent.
$(JDK_IMAGES:%=%.docker.build): %.docker.build:
	$(foreach jdk,$(JDKS),docker build --build-arg JAVA_VERSION=$(jdk) --build-arg TAG=$(TAG) --no-cache $(if $(filter java,$*),--pull) -t octoperf/$*:$(call jdk_tag,$*,$(jdk)) $*/ &&) true
	$(foreach alias,$(aliases),docker tag octoperf/$*:$(call jdk_tag,$*,$(LATEST_JDK)) octoperf/$*:$(alias) &&) true

$(JDK_IMAGES:%=%.docker.push): %.docker.push: %.docker.build
	$(foreach jdk,$(JDKS),docker push octoperf/$*:$(call jdk_tag,$*,$(jdk)) &&) true
	$(foreach alias,$(aliases),docker push octoperf/$*:$(alias) &&) true

%.docker.build:
	docker build --build-arg TAG=${TAG} --no-cache --pull -t octoperf/$*:latest -t octoperf/$*:$(TAG) $*/

%.docker.push: %.docker.build
	docker push octoperf/$*:latest 
	docker push octoperf/$*:$(TAG)
