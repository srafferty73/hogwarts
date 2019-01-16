require_relative('../db/sql_runner')

class Hogwarts

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def pretty_name()
     return "#{@first_name} #{@last_name}"
  end

  def save()
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
     RETURNING *"
     values = [@first_name, @last_name, @house_id, @age]
     harry_data = SqlRunner.run(sql, values)
     @id = harry_data.first()['id'].to_i
   end

   def self.all()
     sql = "SELECT * FROM hogwarts"
     students = SqlRunner.run( sql )
     result = students.map { |student| Hogwarts.new( student ) }
     return result
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
     student = SqlRunner.run( sql, values )
     result = Hogwarts.new( student.first )
     return result
   end

end
