class Article < ApplicationRecord
    validates :title, length: {minimum: 10, message:"Багадаа 5-ийн урттай байна. "}, presence:{ message:"Заавал бөглөнө үү"}
    validates :body, length: {minimum: 10, message:"Багадаа 10-ийн урттай байна. "}, presence:{ message:"Заавал бөглөнө үү"}
end
