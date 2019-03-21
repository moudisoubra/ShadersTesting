using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Spinners : MonoBehaviour
{
    public Vector3 RotationPerSecond;

	void Update ()
	{
        transform.Rotate(RotationPerSecond * Time.deltaTime);
	}
}