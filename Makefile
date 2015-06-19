# -*- Makefile -*-

mesg_start = echo "$(shell tty -s && tput setaf 4)$(1):$(shell tty -s && tput sgr0) $(2)"
mesg_step = echo "$(1)"
mesg_ok = echo "result: $(shell tty -s && tput setaf 2)ok$(shell tty -s && tput sgr0)"
mesg_fail = (echo "result: $(shell tty -s && tput setaf 1)fail$(shell tty -s && tput sgr0)" && false)

UGLIFYCSS ?= uglifycss
UGLIFYCSS_ARGS =

MYTH ?= myth
MYTH_ARGS =

HUGO ?= hugo
HUGO_ARGS =

all: build

clean: clean-style clean-site

build: build-style build-site

STYLE_SRC = src/style/common.css \
	src/style/header.css \
	src/style/article.css

STYLE_OUTPUT = static/assets/css/style.css

STYLE_ROBOTO = static/assets/css/roboto-fontface.css

.PHONY: $(STYLE_OUTPUT)
$(STYLE_OUTPUT): $(STYLE_SRC)
	@$(call mesg_start,build,Merging style files into $(notdir $(STYLE_OUTPUT))...)
	@cat $(STYLE_SRC) | $(MYTH) $(MYTH_ARGS) >$(STYLE_OUTPUT) && \
		$(call mesg_ok) || $(call mesg_fail)
	@$(call mesg_start,build,Packing $(notdir $(STYLE_OUTPUT)) file...)
	@$(UGLIFYCSS) $(UGLIFYCSS_ARGS) $(STYLE_OUTPUT) >$(STYLE_OUTPUT:.css=.min.css) && \
		$(call mesg_ok) || $(call mesg_fail)

clean-style:
	@$(call mesg_start,clean,Cleaning style file...)
	@rm -f $(STYLE_OUTPUT) $(STYLE_OUTPUT:.css=.min.css) && \
		$(call mesg_ok) || $(call mesg_fail)

clean-site:
	@$(call mesg_start,clean,Cleaning site files...)
	@rm -rf public && \
		$(call mesg_ok) || $(call mesg_fail)

build-style: $(STYLE_OUTPUT)
	@$(call mesg_start,build,Packing $(notdir $(STYLE_ROBOTO)) file...)
	@$(UGLIFYCSS) $(UGLIFYCSS_ARGS) $(STYLE_ROBOTO) >$(STYLE_ROBOTO:.css=.min.css) && \
		$(call mesg_ok) || $(call mesg_fail)

build-site:
	@$(call mesg_start,build,Building site...)
	@$(HUGO) $(HUGO_ARGS) -d public && \
		$(call mesg_ok) || $(call mesg_fail)
