require_relative('../db/sql_runner')

class Houses

  attr_reader :id, :logo_url
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo_url = options['logo_url']
  end

  # def pretty_name()
  #    return "#{@first_name} #{@last_name}"
  # end

  def save()
     sql = "INSERT INTO houses
     (
       name,
       logo_url
     )
     VALUES
     (
       $1, $2
     )
     RETURNING *"
     values = [@name, @logo_url]
     house_data = SqlRunner.run(sql, values)
     @id = house_data.first()['id'].to_i
   end

   def self.all()
     sql = "SELECT * FROM houses"
     houses = SqlRunner.run( sql )
     result = houses.map { |house| Houses.new( house ) }
     return result
   end

   def self.delete_all()
     sql = "DELETE FROM houses"
     SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM houses
     WHERE id = $1"
     values = [@id]
     SqlRunner.run( sql, values )
   end

   def self.find( id )
     sql = "SELECT * FROM houses WHERE id = $1"
     values = [id]
     house = SqlRunner.run( sql, values )
     result = Houses.new( house.first )
     return result
   end

end
