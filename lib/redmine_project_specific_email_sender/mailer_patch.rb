module RedmineProjectSpecificEmailSender
  module MailerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def mail_from_with_project_specific_email
        @project ? @project.email : mail_from_without_project_specific_email
      end

      def issue_add_with_project_specific_email(*args)
        @project = args.first.project
        issue_add_without_project_specific_email(*args)
      end

      def issue_edit_with_project_specific_email(*args)
        @project = args.first.journalized.project
        issue_edit_without_project_specific_email(*args)
      end
      
      def document_added_with_project_specific_email(*args)
        @project = args.first.project
        document_added_without_project_specific_email(*args)
      end
      
      def attachments_added_with_project_specific_email(*args)
        @project = args.first.first.container.project
        attachments_added_without_project_specific_email(*args)
      end
      
      def news_added_with_project_specific_email(*args)
        @project = args.first.project
        news_added_without_project_specific_email(*args)
      end
      
      def message_posted_with_project_specific_email(*args)
        @project = args.first.board.project
        message_posted_without_project_specific_email(*args)
      end
    end
  end
end
