
class DepthFirstSearch

  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def shortest_path_between(start, goal)
    all_paths_between(start, goal).first
  end

  def all_paths_between(start, goal)
    paths = search(start, goal)
    order_by_length(paths)
  end

  private

  def successors(start)
    graph.get_successors(start)
  end

  def order_by_length(search)
    search.sort_by { |array| array.size }
  end

  def search(start, goal, path=[])
    path = path + [start]
    paths = []

    successors(start).each do |node|
      unless path.include? node
        new_paths = search(node, goal, path)
        new_paths.each { |new_path| paths << new_path }
      end
    end

    start == goal ? [path] : paths
  end

end

class CampusRouteMap

  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def get_successors(point)
    graph.inject [] do |locations, connection|
      locations << connection[0] if connection[1] == point
      locations << connection[1] if connection[0] == point
      locations
    end
  end

end

connections = [["office", "debuggingRoom"],
               ["office", "CHI343"],
               ["CHI343", "informaticsSchoolOffice"],
               ["informaticsSchoolOffice", "ITS"],
               ["ITS", "PEV11A6"],
               ["PEV11A6", "PEV12A11"],
               ["PEV11A6", "library"],
               ["CHI343", "PEV11A6"],
               ["PEV12A11", "library"],
               ["library", "bridgeTeaBar"],
               ["library", "meetingHouse"],
               ["meetingHouse", "bridgeTeaBar"],
               ["bridgeTeaBar", "debuggingRoom"]]

campus_map = CampusRouteMap.new(connections)
search     = DepthFirstSearch.new(campus_map)
puts search.shortest_path_between("office", "meetingHouse").join(", ")