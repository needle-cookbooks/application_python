module ApplicationPython
  module Celery
    class << self
      def celery_procs(node, type)
        case
        when node.role?('haystack-celeryd-utility') && type.eql?('celeryd')
          2
        when node.role?('haystack-celeryd') && type.eql?('celeryd')
          6
        else
          1
        end
      end

      def celery_proc_name(app_name)
        case
        when app_name.eql?("haystack-celeryd")
          '%(program_name)s_%(process_num)02d'
        else
          '%(program_name)s'
        end
      end
    end
  end
end
