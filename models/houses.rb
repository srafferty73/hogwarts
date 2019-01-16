require_relative('../db/sql_runner')

class Houses

  attr_reader :id, :logo_url, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
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
     RETURNING id"
     values = [@name, @logo_url]
     result = SqlRunner.run(sql, values)
     # @id = house_data.first()['id'].to_i
     id = result.first["id"]
     @id = id.to_i
   end

   def self.all()
     sql = "SELECT * FROM houses"
     house_data = SqlRunner.run( sql )
     houses = map_items(house_data)
     return houses
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
     sql = "SELECT * FROM houses
     WHERE id = $1"
     values = [id]
     result = SqlRunner.run(sql ,values).first
     house = Houses.new(result)
     return house
   end

   def self.map_items(house_data)
    return house_data.map { |house| Houses.new(house) }
   end

end
