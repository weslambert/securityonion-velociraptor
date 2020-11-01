velociraptorgroup:
  group.present:
    - name: velociraptor
    - gid: 989

velociraptor:
  user.present:
    - uid: 989
    - gid: 989
    - home: /opt/so/conf/velociraptor

#velociraptorconfdir:
#  file.directory:
#    - name: /opt/so/conf/velociraptor
#    - user: 939
#    - group: 939
#    - makedirs: True

so-velociraptor:
  docker_container.running:
    - image: wlambert/so-velociraptor
    - binds:
      - /opt/so/conf/velociraptor:/velociraptor:rw
    - port_bindings:
      - 0.0.0.0:8889:8889
      - 0.0.0.0:8001:8001
      - 0.0.0.0:8000:8000
    - environment:
      - VELOX_USER=admin
      - VELOX_PASSWORD=admin
      - VELOX_ROLE=administrator
      - VELOX_SERVER_URL=https://VelociraptorServer:8000/
      - VELOX_FRONTEND_HOSTNAME=VelociraptorServer
