module Ci
  module API
    module Entities
      class Commit < Grape::Entity
        expose :id, :sha, :project_id, :created_at
        expose :status, :finished_at, :duration
        expose :git_commit_message, :git_author_name, :git_author_email
      end

      class CommitWithBuilds < Commit
        expose :builds
      end

      class ArtifactFile < Grape::Entity
        expose :filename, :size
      end

      class Build < Grape::Entity
        expose :id, :commands, :ref, :sha, :status, :project_id, :repo_url,
          :before_sha, :allow_git_fetch, :project_name

        expose :name, :token, :stage

        expose :options do |model|
          model.options
        end

        expose :timeout do |model|
          model.timeout
        end

        expose :variables
        expose :artifacts_file, using: ArtifactFile
      end

      class Runner < Grape::Entity
        expose :id, :token
      end

      class RunnerProject < Grape::Entity
        expose :id, :project_id, :runner_id
      end

      class WebHook < Grape::Entity
        expose :id, :project_id, :url
      end

      class TriggerRequest < Grape::Entity
        expose :id, :variables
        expose :commit, using: Commit
      end
    end
  end
end
