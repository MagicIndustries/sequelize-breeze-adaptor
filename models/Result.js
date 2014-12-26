/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Result', {
    tableName: "spa_vResult",
    freezeTableName: true,

    resultID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    resultTypeID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    testID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    value: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    tenantID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    organizationID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    studentID: {
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
