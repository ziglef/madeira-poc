function loadTileset(filePath, width, height)
   local atlas = love.graphics.newImage(filePath)
   local quads = {}

   for i = 0, atlas:getHeight()/height - 1 do
      for j = 0, atlas:getWidth()/width - 1 do
         table.insert(quads, love.graphics.newQuad(j*width, i*height, width, height, atlas:getDimensions()))
      end
   end

   return atlas, quads
end