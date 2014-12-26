/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('TestResultSet', {
    tableName: "spa_vTestResultSet",
    freezeTableName: true,

    testResultSetID: {
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
    testID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    bLocked: {
      type: DataTypes.INTEGER(4),
      allowNull: false,
      defaultValue: '0'
    },
    testDate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: 'CURRENT_TIMESTAMP'
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: '0000-00-00 00:00:00'
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
