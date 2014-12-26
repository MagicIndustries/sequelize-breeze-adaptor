/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Role_Permission', {
    tableName: "spa_Role_Permission",
    freezeTableName: true,

    roleID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    permissionID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    rolePermissionID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: 'CURRENT_TIMESTAMP'
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: '0000-00-00 00:00:00'
    },
    createdBy: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    updatedBy: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    }
  });
};
