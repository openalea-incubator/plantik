"""


.. testsetup::

    from openalea.plantik.tools import lightinterception

"""
import openalea.fractalysis.light.directLight as directlight
import openalea.plantgl.all as pgl
try:
    from openalea.fractalysis.fractutils.pgl_utils import surfPerTriangle, \
        gridIndex, color, scene2grid, toPglScene
except:
    print 'Could not import fractalyis'
    pass
from copy import deepcopy

#directlight.diffuseInterception(scene)
#for k in sl.keys(): 
#   if k <= len(resTh):
#       assert abs(sl[k] - resTh[k]) < 0.5

from openalea.plantgl.algo import surface, volume

def star(s, Viewer):
    Viewer.display(s)
    Viewer.camera.setOrthographic()
    # set direction ? 
    proj, nbpixel, pixelsize = Viewer.frameGL.getProjectionSize()
    return proj/surface(s)

from openalea.plantgl.all import Vector3
from math import exp
def stars(leaves,  g, direction=Vector3(1,1,1), up=Vector3(0,0,1), 
          right=Vector3(1,1,1), beam_radius=.1):
    from openalea.plantik.tools.convex import cvxHull
    from openalea.plantgl.all import BoundingBox, Viewer, norm
    hull = cvxHull(leaves)
    lad = surface(leaves) / volume(hull)
    print lad
    bbx = BoundingBox(hull)
    pos = bbx.upperRightCorner
    interception = 0.
    for rshift in range(bbx.getSize().y/beam_radius):
        for upshift in range(bbx.getSize().z/beam_radius):
            sx = 1
            sy = 1
            print     pos - rshift*right-upshift*up
            intersections = Viewer.frameGL.castRays(pos - 
                                rshift*right-upshift*up, direction, 
                                Vector3(0.5,0.,0), Vector3(0,0.5,0), sx, sy)
            print intersections
            p = 1
            for intersection in intersections.flatten():
                length = norm(intersection.out - getattr(intersection,'in'))
                length = 1
                p *= exp(-g*lad(length))
        interception += (1. - p) * beam_radius**beam_radius
    return interception / surface(leaves)

#pixpershape, pixsize = Viewer.frameGL.getProjectionPerShape()
#proj, nbpixel, pixelsizie = Viewer.frameGL.getProjectionSize()



class Voxels(object):

    def __init__(self, size, centers, density=None):

        self.size = size
        self.centers = centers
        self.density = density

    def __repr__(self):
        
        return "Voxels size : " + str(self.size) + "\n Voxels centers : " + \
            str(self.centers) + "\n Voxels density : " + str(self.density)



def voxelize(scene, gridSize, density=True ):
    """Generate the scene resulting of grid discretization
  
    from fractalysis wralea

    :Parameters:
      - `Scene` : PlantGL scene
      - `Division Factor` : Division factor of the bounding box
     - `Density` : Taking density into account
 
    :Types:
      - `Scene` : Pgl scene
      - `Division Factor` : int 
      - `Density` : boolean

    :returns:
      - `Voxel size` : List of intercepted voxels size
      - `Centers` : List of intercepted voxels centers
      - `Densities` : List of intercepted voxels densities
      - `VoxScene` : Scene of intercepted voxels

    :returntype:
      - `Voxel size` : [ float ] 
      - `Centers` : [ ( float ) ]
      - `Densities` :  [ float ]
      - `VoxScene` : Plg scene


    ::

        s = lsystem.sceneInterpretation(lstring)
        Viewer.display(s)
        voxels = lightinterception.voxelize(s, 3, density=True)
    """

    #scene = pgl.Scene(sceneFile)
    bbox = pgl.BoundingBox(scene)
    epsilon = pgl.Vector3( 0.01, 0.01, 0.01 )
    origin = bbox.lowerLeftCorner - epsilon
    step = ( bbox.getSize() + epsilon )*2 / ( gridSize )
    origin_center = origin + step/2.
  
    tgl_list = surfPerTriangle( scene )

    grid = {}
    for tgl in tgl_list:
        pos = gridIndex( tgl[ 0 ] - origin, step )
        assert( pos[ 0 ] < gridSize and pos[ 1 ] < gridSize and 
                pos[ 2 ] < gridSize )

        if grid.has_key(  pos  ):
            grid[  pos  ] += tgl[ 1 ]
        else:
            grid[  pos  ] = tgl[ 1 ]

    kize = grid.keys()
    kize.sort()
    pts=[]
    mass=[]
    for k in kize:
        pts.append(  list( k )  )
        mass.append( grid[ k ] )
    
    massort = deepcopy( mass )
    massort.sort()
    qlist=[25, 50, 75]
    quants = [massort[int(len(massort)*q/100.0)] for q in qlist]
  
    voxSize = step/2.
    vox = pgl.Box( voxSize )
    vox.setName( 'voxel' )
  
    mat1 = color( 47,255,0, trans=True , name='c_green')
    mat2 = color( 255,255,0, trans=True , name='c_yellow')
    mat3 = color( 255,170,0, trans=True , name='c_orange')
    mat4 = color( 255,0,0, trans=True , name='c_red')
  
    #sc = pgl.Scene()
    ctrs = []
    for i in xrange( len( pts ) ):
        pt = pts[ i ]
        vect = pgl.Vector3( origin_center.x + ( pt[ 0 ] * step.x ),
                            origin_center.y + ( pt[ 1 ] * step.y ),
                            origin_center.z + ( pt[ 2 ] * step.z ) )
        ctrs.append(vect)
        geometry = pgl.Translated( vect, vox )
        if( density ):
            if ( mass[ i ] < quants[ 0 ] ) :
                sh = pgl.Shape( geometry, mat1, i )
            elif ( mass[ i ] < quants[ 1 ] ) :
                sh = pgl.Shape( geometry, mat2, i )
            elif ( mass[ i ] < quants[ 2 ] ) :
                sh = pgl.Shape( geometry, mat3, i )
            else :
                sh = pgl.Shape( geometry, mat4, i )
        else:
            sh = pgl.Shape( geometry, mat1, i )
        scene.add( sh )
  
    vxls = Voxels( voxSize, ctrs, mass ) 

    #return (vxls, scene)
    return ( voxSize, ctrs, mass, scene ) 




"""example
s = lsystem.sceneInterpretation(lstring)
Viewer.display(s)
Viewer.display(voxels[3])
voxels = openalea.plantik.tools.lightinterception.voxelize(s, 3, density=True)
"""
