#!/usr/local/bin/python

import original_initialize as oi


GRAYLOG_TEMPLATE = """
  <graylog>
    server %s
    facility %s
  </graylog>
"""


class Environment(oi.Environment):

    def setup_graylog(self):
        """ Send logs to graylog
        """


        graylog = self.env.get('GRAYLOG', '')
        facility = self.env.get('GRAYLOG_FACILITY', '')

        if graylog and facility:
            config = ""
            with open(self.zope_conf, "r") as cfile:
                config = cfile.read()

            print("Sending logs to graylog: '%s' as facilty: '%s'" % (graylog, facility))
            if 'eea.graylogger' in config:
                return

            template = GRAYLOG_TEMPLATE % (graylog, facility)
            config = "%import eea.graylogger\n" + config.replace('</logfile>', "</logfile>%s" % template)
            with open(self.zope_conf, "w") as cfile:
                cfile.write(config)
        else:
            print("Graylog disabled! Configure both GRAYLOG and GRAYLOG_FACILITY envs to enable!")

    def setup(self):
        super(Environment, self).setup()
        self.setup_graylog()


def initialize():
    environment = Environment()
    environment.setup()


if __name__ == "__main__":
    initialize()
