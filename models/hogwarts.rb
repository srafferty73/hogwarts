require_relative('../db/sql_runner')

class Hogwarts

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def pretty_name()
     return "#{@first_name} #{@last_name}"
  end

  def save() #we previously had 'RETURNING *'
     sql = "INSERT INTO hogwarts
     (
       first_name,
       last_name,
       house_id,
       age
     )
     VALUES
     (
       $1, $2, $3, $4
     )
     RETURNING id"
     values = [@first_name, @last_name, @house_id, @age]
     harry_data = SqlRunner.run(sql, values)
     # @id = harry_data.first()['id'].to_i
     id = result.first['id']
     @id = id
   end

   # ADDED from solution
   def house()
     house = Houses.find(@house_id)
     return house
   end
   #  ------------------

   def self.all()
     sql = "SELECT * FROM hogwarts"
     students = SqlRunner.run( sql )
     result = students.map { |student| Hogwarts.new( student ) }
     return result
   end

   def self.map_items(student_data)
    return student_data.map { |student| Hogwarts.new(student) }
   end

   def self.delete_all()
     sql = "DELETE FROM hogwarts"
     SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM hogwarts
     WHERE id = $1"
     values = [@id]
     SqlRunner.run( sql, values )
   end

   def self.find( id )
     sql = "SELECT * FROM hogwarts WHERE id = $1"
     values = [id]
     result = SqlRunner.run( sql, values ).first
     student = Hogwarts.new( result)
     return result
   end

end
