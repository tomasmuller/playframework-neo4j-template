package repositories;

import org.springframework.data.neo4j.repository.GraphRepository;

import models.World;

public interface WorldRepository extends GraphRepository<World> {
}