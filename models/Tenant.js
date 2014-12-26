/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Tenant', {
    tableName: "spa_Tenant",
    freezeTableName: true,

    tenantID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    dbuser: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    dbPass: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    bActive: {
      type: DataTypes.INTEGER(4),
      allowNull: false,
      defaultValue: '1'
    },
    bLocked: {
      type: DataTypes.INTEGER(4),
      allowNull: false,
      defaultValue: '0'
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
