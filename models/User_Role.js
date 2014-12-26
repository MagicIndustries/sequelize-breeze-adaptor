/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('User_Role', {
    tableName: "spa_vUser_Role",
    freezeTableName: true,

    userRoleID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    userID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    roleID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    tenantID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    organizationID: {
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
