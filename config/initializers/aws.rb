AWS.config(access_key_id:     ENV['AKIAJUD4SFZKM5Q4W7KQ'],
           secret_access_key: ENV['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'] )

S3_BUCKET = AWS::S3.new.buckets[ENV['leadapp']]