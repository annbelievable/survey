# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

q1 = ['My company offers more product choices than competitors.',
'My company offers a broader range of products than competitors.',
'My company offers more product combinations than competitors.',
'My company serves more market segments than competitors.',
'My company has larger market share than competitors.']

5.times do
  n = 0
  Question.create(
    section: 'Strategy',
    question: q1[n],
    instruction: 'Please select ONLY ONE statement.',
    question_type: 'single'
  )
  n+=1
end

q2 = ['My company operations can be best described as:',
'My company’s deliveries can be best described as:']

2.times do
  n = 0
  Question.create(
    section: 'Performance',
    question: q2[n],
    instruction: 'You may select MORE THAN ONE statement.',
    question_type: 'multiple'
  )
  n+=1
end

q3 = ['My company performs better than competitors in marketing innovations.',
'My company has developed new distribution channels for products and services.',
'My company has been able to secure customers for repeat purchases.']

3.times do
  n = 0
  Question.create(
    section: 'Performance',
    question: q3[n],
    instruction: 'Please select ONLY ONE statement.',
    question_type: 'single'
  )
  n+=1
end

q = [1,2,3,4,5,8,9,10]
a= {'Never' => 0,	'Seldom' => 1,	'Regularly' => 2,	'Very regularly' => 3,	'Always' => 4}
q.each do |i|
  a.each do |key, value|
    Answer.create(
      question_id: i,
      answer: key,
      score: value
    )
  end
end

a6 = {'My company has low product defect rates.' => 0,	'My company’s products are reliable.' => 1,	'My company has low production waste.' => 2,	'My company achieves high operating efficiency.' => 3}

a6.each do |key, value|
  Answer.create(
    question_id: 6,
    answer: key,
    score: value
  )
end

a7 = {'My company provides fast deliveries.' => 0,	'My company’s deliveries are reliable.' => 1,	'My company’s deliveries have received zero complaints.' => 2,	'My company’s deliveries have never damage the company products.' => 3,	'My company’s deliveries are always on time.' => 4}

a7.each do |key, value|
  Answer.create(
    question_id: 7,
    answer: key,
    score: value
  )
end
