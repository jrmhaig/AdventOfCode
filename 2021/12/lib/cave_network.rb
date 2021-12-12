require 'cave_factory'

class CaveNetwork
  def initialize(traveller: @traveller)
    @caves = {}
    @traveller = traveller
    @factory = CaveFactory.new(traveller: @traveller)
  end

  def add_passage(start, finish)
    cave(start).join(cave(finish))
    cave(finish).join(cave(start))
  end

  def search(*explored)
    @traveller.reset
    @caves.values.each(&:unvisit)
    explored.each(&:visit)

    explored.last.options.sum do |cave|
      cave.id == 'end' ? 1 : search(*explored, cave)
    end
  end

  def cave(id) = @caves[id] ||= @factory.create(id)
end
