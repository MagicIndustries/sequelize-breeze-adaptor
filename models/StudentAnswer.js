/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('StudentAnswer', {
    tableName: "spa_vStudentAnswer",
    freezeTableName: true,

    studentAnswerID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    answerTypeID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    testID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    organizationID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    tenantID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    value: {
      type: DataTypes.TEXT,
      allowNull: true,
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
