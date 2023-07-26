require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
    
end

class User
    def initialize(hash)
        @id = hash["id"]
        @fname = hash["fname"]
        @lname = hash["lname"]
    end
    def self.find_by_id(prime_key)
        data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = #{prime_key}")
        User.new(data[0])
    end
end

class Question
    def self.find_by_id(prime_key)
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE id = #{prime_key}")
        Question.new(data[0])
    end
end

class QuestionsFollow
    def self.find_by_id(prime_key)
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows WHERE id = #{prime_key}")
        QuestionFollow.new(data[0])
    end
end

class Reply
    def self.find_by_id(prime_key)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE id = #{prime_key}")
        Reply.new(data[0])
    end
end

class QuestionLike
    def self.find_by_id(prime_key)
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes WHERE id = #{prime_key}")
        QuestionLike.new(data[0])
    end
end
